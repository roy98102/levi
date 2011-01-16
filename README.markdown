# 501k Website

This website uses Ruby on Rails.


## Git'n started

1. Install `ruby-1.9.2` somehow.
    * If you have `rvm` (*nix):
            rvm install ruby-1.9.2
            rvm use ruby-1.9.2
            rvm gemset create levi
    
      `rvm` is not required though.

1. Install `git` somehow.

    * On the Mac, you should also install `gitx`. You might want this in ~/.gitconfig
            [core]
            autocrlf = input
            safecrlf = warn

    * On Windows, you might want [GitExtensions](http://code.google.com/p/gitextensions) for Visual Studio, or [TortoiseGit](http://code.google.com/p/tortoisegit/). For command-line use, [mysysgit](https://git.wiki.kernel.org/index.php/MSysGit:InstallMSysGit). You will also want this in your .git/config (or ~/.gitconfig):
            [core]
            autocrlf = true
            safecrlf = warn

1. Create a GitHub account.

1. Go to [roy98102/levi](https://github.com/roy98102/levi) and click "Fork".

1. Then:
        git clone git@github.com:${USER}/levi.git
        cd levi
        # Answer 'y' if it asks you to trust the .rvmrc file.
        gem env gemdir

    If you are using rvm, that should show something like:
        ~/.rvm/gems/ruby-1.9.2-p0@levi

1. Next:
        git remote add upstream git://github.com/roy98102/levi.git
        gem install bundler
        bundle install
        rails server -p 3000

1. Visit:
    [http://localhost:3000](http://localhost:3000)

You should see the default Rails welcome screen:
> Welcome aboard
>
> You're riding Ruby on Rails!
>
> ...

## General guidelines.

* For commit messages, always give a summary line, then a blank line, then whatever details you want. E.g.

        git commit
        ---<editor starts up>---
        Added killer featureX.

        - Ported to Python.
        - Switched language to Turkish.

* (This is a Work In Progress.)

## Integration procedure.

We are using the *Integration Manager* workflow [Figure 5-2](http://progit.org/book/ch5-1.html).

1. Develop a feature in a branch.

        git checkout -b feature master
        # Code, commit, code, commit, ...

1. When done, push the branch to your GitHub repo.

        git push origin feature

1. Within your levi fork on GitHub, issue a *pull request*.
1. Anyone can comment on the code. Converse! Look for errors, not style.
1. Any "Integration Manager" (anyone listed as a collaborator on the roy98102/levi repo) will test the commits, as described at GitHub at the bottom of the page where the *pull request* is discussed. It says this:

    > How to merge this pull request (called `feature` from `cdunn2001`):

   1. Check out a new branch to test the changes — run this from your project directory
 
            git clone git@github.com:roy98102/levi.git levi
	    cd levi
            git checkout -b cdunn2001-feature master

   2. Bring in cdunn2001's changes and test
     
            git pull https://cdunn2001@github.com/cdunn2001/pulltest.git feature
            # Test.
    
   3. Merge the changes and update the server
     
            git checkout master
            git merge cdunn2001-feature
            git push origin master

      With that, the `feature` branch will *not* exist in roy98102, which is good. Only the changes on it have been merged into the `master` branch. 
   4. Close the pull request.

1. Sync up.

	git checkout master
	git pull upstream master

1. At that point, you (the submitter) may continue development on the feature branch, since everything is in sync. (If you are not sure, run `gitx`.) If you are done, you may delete the feature branch from your own repo, if you want. Optional:

        git checkout master
        git br -d feature
        git push origin :feature # to delete from GitHub too

That's basically the "Merge workflow" under "DISTRIBUTED WORKFLOWS" [here](http://www.kernel.org/pub/software/scm/git/docs/gitworkflows.html).

Remember: Branch early and often!
#
### Fork queues
If you notice GitHub's [fork queues](https://github.com/blog/270-the-fork-queue), ignore them.

### Notes
* [Useful cheatsheet.](http://cheat.errtheblog.com/s/git)
* I am working on these notes by modifying these notes.

