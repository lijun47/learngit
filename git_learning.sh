#配置:
git config --global user.name 'lijun'
git config --global user.email '574747217@qq.com'

git config --unset --global user.name
git config --unset --global user.email

#pg:
git config --global user.name 'lijun'
git config --global user.email '574747217@qq.com'
git config --local user.name 'lijun01'
git config --local user.email '57474721@qq.com'

git commit --allow-empty -m 'Initial'

#重命名文件:
#把readme重命名为readme.md
git add readme.md
git rm readme

或者: git mv readme readme.md

#查看版本历史: git log
git log --all
git log --oneline       #查看单行的简洁历史
git log --oneline -n4   #查看最近的4条简洁历史
git log --oneline --all -n4
git log --oneline --all -n4 --graph
git log --oneline dev   #查看dev分支的单行的简洁历史

git help --web log  #跳转到git log的帮助文档网页

#gitk:

#.git目录:
HEAD: 当前的工作分支  
    ref: refs/heads/master
config: 存放本地仓库（local）相关的配置信息。
refs: 分支和tag的引用
  /heads: 存放分支
  /tags: 存放tag
  git cat-file -t commit_id

objects: 文件夹中的子文件夹都是以哈希值的前两位字符命名
    每个object由40位字符组成，前两位字符用来当文件夹，后38位做文件。

git cat-file 命令 显示版本库对象的内容、类型及大小信息。
git cat-file -t b44dd71d62a5a8ed3 显示版本库对象的类型
git cat-file -s b44dd71d62a5a8ed3 显示版本库对象的大小
git cat-file -p b44dd71d62a5a8ed3 显示版本库对象的内容

#commit、tree、blob:
touch readme
git add readme
git status
mkdir doc
echo "hello,world!" > doc/readme
git add doc

$ find .git/objects -type f
.git/objects/b6/1830f441696560b90a98e02d8471431207eefd
.git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391

#查看提交的文件内容:
git cat-file -p e69de29bb2d1
git cat-file -p b61830f441

#分离头指针: 提交的代码没有和分支对应起来，当切换到其他分支的时候(比如master分支)，容易丢失代码；
git checkout commitID

git branch <新分支的名称> commitId

#HEAD和branch:
#创建一个新分支并切换:
git checkout -b fix_readme

#比较两次commit的不同:
git diff commitID1 commitID2

git diff HEAD HEAD^     #同: git diff HEAD HEAD~1

#删除分支:
git branch -D fix_readme

#个性commit message:
git commit --amend      #修改最近一次提交
git rebase -i commitID  #修改老旧commit的message

git rebase -i 开始commitID的前一个    #连续多个commit整合
git rebase -i 整合的commitID的前一个   #间隔的几个commit整合

#工作区和暂存区文件差异:
git diff -- filename    #指定文件的区别
git diff --cached   #查看暂存区修改的内容

#工作区的文件恢复为暂存区文件:
git checkout -- filename

#暂存区恢复成和HEAD的一样: 暂存区恢复
git reset HEAD      #恢复所有

#取消暂存区部分文件的更改: 恢复指定文件
git reset HEAD  -- filename filename2

#消除最近的几次提交:
git reset --hard hash值      #恢复到指定commit
git reset --hard 9555029

#查看不同提交的指定文件差异:
git diff master dev -- filename
git diff  f9bd367  9555029 -- filename

#删除文件方法:
git rm readme

#当前任务暂停:
git stash
git stash list
git stash apply     #保留stash
git stash pop       #不保留stash    

#指定不需要git管理的文件:
把想忽略的文件添加到 .gitignore

#备份: --bare不带工作区
git clone --bare /.../.git
git clone --bare file://.../.git

#本地更新至远端:
git remote -v   #查看远程版本库信息
git remote add git_learning file://../git_learning.git 
git push --set-upstream git_learning

git remote add github <url> #添加本库至github远程版
git fetch githup            #拉取远程github库

git pull

#gitlab:
持续集成（CONTINUOUS INTEGRATION）CI
持续交付（CONTINUOUS DELIVERY）CD
持续部署（CONTINUOUS DEPLOYMENT）




















