

*** Settings ***
Library    pylib.CourseAPI


Suite Setup        add_course    python   python语言  2    suite_python_courseid
Suite Teardown     delete_course   ${suite_python_courseid}