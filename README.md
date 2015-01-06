# How to install using Vagrant
1. Install VirtualBox
2. Install [Vagrant](https://www.vagrantup.com/)
3. Run following in directory with cloned code:

```
vagrant plugin install vagrant-vbguest
vagrant plugin install vagrant-librarian-chef
```

> If you're using default or fresh Vagrant installation, remember to uncomment linke 23 in `Vagrantfile`.

```
vagrant up # to create and provision virtual image
vagrant ssh # to log in into Vagrant box
```
once logged in to Vagrant box:

```
cd /vagrant
bundle install
./bin/rake db:create db:migrate
./bin/rails s
```

Point your browser to [http://localhost:3001](http://localhost:3001)

