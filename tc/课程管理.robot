*** Settings ***
Library    pylib.CourseAPI
Variables   cfg.py



*** Test Cases ***
添加课程1 - tc000001

# 先列出课程
    ${listRet1}=    list_course 

# 再添加一门课程
    ${addRet}=   add_course    python   python语言  2    
    should be true     $addRet['retcode']==0

# 再列出课程
    ${listRet2}=    list_course 
    ${added}=    get_new_course  &{listRet2}[retlist]   &{listRet1}[retlist]
    should be true    len($added)==1
    should be true    $added[0]['name']=='python'
    should be true    $added[0]['desc']=='python语言'
    should be true    $added[0]['display_idx']==2

    [Teardown]    delete_course   &{addRet}[id]
