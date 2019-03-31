* Add a remote
git remote add bb https://user@bitbucket.org/user/whatever.git

* push to remote
git push -u bb

* git remote show origin

* Change remote to a new fork
git remote set-url origin https://github.com/....git

* CRLF LF et al
git config --global core.autocrlf input
ref: https://stackoverflow.com/questions/5834014/lf-will-be-replaced-by-crlf-in-git-what-is-that-and-is-it-important
"This setup should leave you with CRLF endings in Windows checkouts, but LF endings on Mac and Linux systems and in the repository."

* Set different usernames for different projects
ref https://stackoverflow.com/questions/8801729/is-it-possible-to-have-different-git-config-for-different-projects
The .git/config file in a particular clone of a repository is local to that clone . Add below:
[user]
        name = Firstname Lastname
        email = firstname.lastname@gmail.com
[remote "origin"]
    url = https://username@github.com/....

* cleanup: git gc --prune=now

* Viewing unpushed git commits
    1. git log origin/master..HEAD
    2. view the diff using the same syntax: git diff origin/master..HEAD

### Git LFS
    1. Install. MacOS: brew install git-lfs
    2. In your git repo dir:
        * git lfs install
        * git lfs track "*.csv"
        * git add .gitattributes
        * git add file.csv ...

### Github

* Set github password on MacOS
    1. https://help.github.com/articles/caching-your-github-password-in-git/
    2. https://help.github.com/articles/updating-credentials-from-the-osx-keychain/
* Use github from command line with 2 factor auth
    https://help.github.com/en/articles/accessing-github-using-two-factor-authentication

### Git submodules
    * Get submodules into existing git clone
    git submodule update --init --recursive

