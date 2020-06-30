*** Settings ***
Library    pylib.CourseAPI


Suite Setup     Run Keywords   admin login    auto    sdfsdfsdf  AND
            ...   delete all course
