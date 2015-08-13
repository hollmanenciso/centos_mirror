This is a docker image of centos:6 for create a local centos mirror with all repositorys that you need.

You can modify the mirror that i use to download the packages. remenber that just work with the servers that accept rsync. All list on http://centos.org/download/mirrors/

The container will expose an apache server on port 80 by default with all mirrors created.
