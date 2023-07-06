# Welcome to lazy-ansible

## Quick reference

-   **Maintained by**  
    [Me : Klemens](https://gitlab.com/Klemens_Galus)
You need a ssh folder with your ssh key.s ans a config file 

## Supported release tags  
i don't recommend to use [latest](https://github.com/klemens-galus/lazy-ansible) because it correspond to my last push on master (Always fix your version with a tag) ! 
- [1.0.2](https://github.com/klemens-galus/lazy-ansible/tree/1.0.2)

## Supported beta tags
**No beta for the moment**  

## Quick reference (cont.)

**An issue ?**  
[https://github.com/klemens-galus/lazy-ansible/issues](https://github.com/klemens-galus/lazy-ansible/issues)

## What is lazy-ansible
First of all ansible is a way to automate application deployement and configuration management [here](https://www.ansible.com/).

Lazy-ansible is a fast way to run ansible without installing it !

## How to run it !

```
docker run -it -v <ssh folder>:/root/.ssh -v <ansible project folder>:/root/lazy-ansible test bash
```

### SSH folder
Your ssh folder need to look at this 
--
  |-config
  |-publickey.pub
  |-privatekey

In your config 
```
Host *
  IdentityFile ~/.ssh/privatekey
```

You need to respect the `~/.ssh/`