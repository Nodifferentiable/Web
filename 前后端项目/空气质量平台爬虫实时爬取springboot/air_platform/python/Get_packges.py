import pkg_resources

# pip list --path==E:\CompileAPP\InterpreterAPP\Python\py3.1\Lib 当前python环境
paths = ['E:\CompileAPP\InterpreterAPP\Python\py3.1\Lib']
working_set = pkg_resources.WorkingSet(paths)

lst = [d for d in working_set]
for item in lst:
    print(item.project_name, item.version)  # 包名和版本
    print(item.requires())      # 所依赖的其他包


#或者
#  pip freeze > ./requirements.txt