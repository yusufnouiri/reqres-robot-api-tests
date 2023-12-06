# Robot framework API test for site reqres.in

I'm going to explain how to do an API test with the robot framework using python.

As a precondition, we'll prepare our environment and packages.

In the repository we will create the virtual environment : 

```sh
python3 -m pip install --user virtualenv
python3 -m venv .venv
source .venv/bin/activate
```

For the packages we need to use: 

```sh
pip3 install robotframework
pip3 install requests
pip3 install robotframework-requests
pip3 install robotframework-jsonlibrary
```

To execute :
```sh
robot demo.robot
```
