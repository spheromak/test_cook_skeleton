skeleton cook that contains my current standard cookbook build testing framework

## Whats inside
- Berksfile - berks default with vim hints  (needs the emacs hints too)
- chefignore - some stuff we don't want on the chef-server
- Gemfile - everyone loves bundler right ?
- .gitignore
- Guardfile that calls the static specs and kitchen converge/test on various bits. Tune to your liking
- .kitchen.lxc.yml - example simple kitchen-lxc config 
- .kitchen.yml - default kitchen.yml with provisionerlesss boxes. (using vagrant) 
- metadata.rb - need this so the tests will pass :)
- Rakefile with all tool tasks in it
- README.md -  OHAI
- .tailor a tailor config suited for chef (long lines on attributes allowed)
- test - example bats and serverspec test(s) for kitchen to run

## Usage
### Install gems

     bundle install

### Guard
Start guard which will start TK instances and start watching yer stuff

     guard 

### Hack
start adding files and watch guard run yer kitchen!!
