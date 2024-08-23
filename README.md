![image](https://github.com/user-attachments/assets/0f69dcf0-d3b3-4c96-a15e-5b78590a0d8c)

# SimpleEducationNetwork - Solidity Smart Contract

## Vision
The SimpleEducationNetwork aims to revolutionize education by creating a decentralized platform where educators can offer courses and students can enroll and learn without intermediaries. This project aspires to make education more accessible, transparent, and secure, leveraging the power of blockchain technology.

## Flowchart Description
1. **User Registration**: Users register as either students or educators.
2. **Course Creation**: Educators create courses with a title and a fee.
3. **Enrollment**: Students enroll in courses by paying the required fee.
4. **Information Retrieval**: Anyone can retrieve course details, including the title, educator, fee, and number of students enrolled.

```
[Flowchart]
    User (Student/Educator) --> RegisterUser()
    Educator --> CreateCourse()
    Student --> EnrollInCourse()
    Public --> GetCourse()
```

## Contract Address
This contract is deployed on the Ethereum Rinkeby Testnet at the following address:

**`0xfd40e32d9dd1f199f65eb98765c06262fe8c577b`**
![image](https://github.com/user-attachments/assets/cd89f7bf-42e2-4008-8cc7-8031965570f0)


You can interact with it using any Ethereum wallet or DApp browser, such as MetaMask.

## **Contact Information**
**Developer:** Ankit Budhathoki
**Email:** ankitbudhathoki0314@gmail.com
**GitHUb:** ankitbudhathoki


### Functions
- **registerUser(string memory _name, bool _isStudent, bool _isEducator)**: Registers a user as a student or educator.
- **createCourse(string memory _title, uint _fee)**: Allows educators to create a course with a specified title and fee.
- **enrollInCourse(uint _courseId)**: Allows students to enroll in a course by paying the required fee.
- **getCourse(uint _courseId)**: Retrieves course details such as title, educator, fee, and student count.

### Events
- **UserRegistered(address userAddress, string name, bool isStudent, bool isEducator)**
- **CourseCreated(uint courseId, string title, address educator)**
- **StudentEnrolled(uint courseId, address student)**

### State Variables
- **courseCount**: Tracks the total number of courses created.
- **users**: Maps user addresses to their registration details.
- **courses**: Maps course IDs to their corresponding course details.

## Deployment Instructions
1. Clone the repository.
2. Compile the contract using Truffle.
3. Deploy the contract to your preferred Ethereum testnet.
4. Interact with the contract via a DApp or script.

## Conclusion
The SimpleEducationNetwork project lays the foundation for a decentralized, open, and fair educational platform. By eliminating intermediaries and ensuring transparent transactions, this project has the potential to democratize education on a global scale.
```

This `README.md` provides a concise yet comprehensive overview of the project, including its vision, functionality, and future potential.
