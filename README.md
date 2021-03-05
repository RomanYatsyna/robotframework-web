# robotframework-web

A demo project that shows the idea how robotframework works with Selenium. The example contains a couple of test using
Wikipedia.

### Helpful articles:

- [robotframework.org](https://robotframework.org/)
- [SeleniumLibrary on GitHub](https://github.com/robotframework/SeleniumLibrary)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Allure Docs](https://docs.qameta.io/allure/)
### Setup:
- Set up a virtual environment  
  ```
  cd <project_folder>  
  virtualenv -p python venv  
  source venv/bin/activate  
  pip install -r requirements.txt
- Install webdriver to local machine e.g. Chrome  
  ```
  webdrivermanager chrome --linkpath /usr/local/bin
- Add libs to PYTHONPATH
  ```
  export PYTHONPATH="${PYTHONPATH}:[PATH TO PROJECTS DIR]/robotframework-web/libs/"
- run tests in command line from project root
  ```
  robot --outputdir results --listener "allure_robotframework;./results/allure" ./tests
- For debugging in PyCharm script path is ./venv/bin/robot
- To generate Allure report  
  1. Install Allure
  2. Generate Allure report  
    allure generate --clean  results/allure
  3. Execute index.html from allure-report folder
