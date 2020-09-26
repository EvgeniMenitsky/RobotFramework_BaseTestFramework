# RobotFramework_BaseTestFramework
Simple UI test framework (only RobotFramework) for fast starting automate testing activities

Running tests:
1. Create project folder - mkdir testfolder && cd path/to/testfolder
2. Create environment - python3 -m venv env
3. Get librarys - pip install -r requirements.txt
4. Run tests in CMD - E.g. _robot -T -d reports -n noncritical -t "Name of Test Case Here" test_case/path/to/case.robot_  or _robot -T -d reports -n noncritical test_case/path/to/case.robot_ for all suite 
