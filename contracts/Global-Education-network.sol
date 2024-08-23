// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleEducationNetwork {

    // Define a User structure
    struct User {
        string name;
        bool isStudent;
        bool isEducator;
    }

    // Define a Course structure
    struct Course {
        uint id;
        string title;
        address educator;
        uint fee;
        uint studentCount;
        mapping(address => bool) enrolledStudents;
    }

    // State variables
    uint public courseCount = 0;
    mapping(address => User) public users;
    mapping(uint => Course) public courses;

    // Events
    event UserRegistered(address userAddress, string name, bool isStudent, bool isEducator);
    event CourseCreated(uint courseId, string title, address educator);
    event StudentEnrolled(uint courseId, address student);

    // Register as a student or educator
    function registerUser(string memory _name, bool _isStudent, bool _isEducator) public {
        require(bytes(_name).length > 0, "Name is required.");
        require(_isStudent || _isEducator, "You must choose a role.");
        require(!users[msg.sender].isStudent && !users[msg.sender].isEducator, "User already registered.");

        users[msg.sender] = User({
            name: _name,
            isStudent: _isStudent,
            isEducator: _isEducator
        });

        emit UserRegistered(msg.sender, _name, _isStudent, _isEducator);
    }
 
    // Create a course (only educators)
    function createCourse(string memory _title, uint _fee) public {
    require(users[msg.sender].isEducator, "Only educators can create courses.");
    require(bytes(_title).length > 0, "Course title is required.");

    courseCount++;
    Course storage newCourse = courses[courseCount]; // Create a local variable of the same type as your storage variable.
    
    newCourse.id = courseCount;  // Assign values to your local variable one by one.
    newCourse.title = _title;
    newCourse.educator = msg.sender;
    newCourse.fee = _fee;
    newCourse.studentCount = 0;
    
    emit CourseCreated(courseCount, _title, msg.sender);
        

        emit CourseCreated(courseCount, _title, msg.sender);
    }

    // Enroll in a course (only students)
    function enrollInCourse(uint _courseId) public payable {
        Course storage course = courses[_courseId];
        require(users[msg.sender].isStudent, "Only students can enroll.");
        require(course.id != 0, "Course does not exist.");
        require(msg.value == course.fee, "Incorrect course fee.");
        require(!course.enrolledStudents[msg.sender], "Already enrolled in this course.");

        course.enrolledStudents[msg.sender] = true;
        course.studentCount++;

        // Transfer the course fee to the educator
        payable(course.educator).transfer(msg.value);

        emit StudentEnrolled(_courseId, msg.sender);
    }

    // Get course information
    function getCourse(uint _courseId) public view returns (string memory, address, uint, uint) {
        Course storage course = courses[_courseId];
        require(course.id != 0, "Course does not exist.");
        return (course.title, course.educator, course.fee, course.studentCount);
    }
}

