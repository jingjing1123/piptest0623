*** Settings ***
Library    pylib.CourseAPI
Variables   cfg.py



*** Test Cases ***
添加课程2 - tc000002

# 先列出课程
    ${listRet1}=    list_course 

# 再添加一门课程
    ${addRet}=   add_course    python   python语言  2    
    should be true     $addRet['retcode']==2
    should be true     $addRet['reason']=='同名课程已经存在'

# 再列出课程
    ${listRet2}=    list_course 
    ${added}=    get_new_course  &{listRet2}[retlist]   &{listRet1}[retlist]
    should be true    len($added)==0

