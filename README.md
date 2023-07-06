# Welcome to lazy-terraform

## Quick reference

-   **Maintained by**  
    [Me : Klemens](https://gitlab.com/Klemens_Galus)

## Supported release tags  
i don't recommend to use [latest](https://github.com/klemens-galus/lazy-terraform) because it correspond to my last push on master (Always fix your version with a tag) ! 
- [1.0.0](https://github.com/klemens-galus/lazy-terraform/tree/1.0.0)
- [1.0.1](https://github.com/klemens-galus/lazy-terraform/tree/1.0.1)

## Supported beta tags
**No beta for the moment**  

## Quick reference (cont.)

**An issue ?**  
[https://github.com/klemens-galus/lazy-terraform/issues](https://github.com/klemens-galus/lazy-terraform/issues)

## What is lazy-terraform
Lazy-terraform provide terraform and terragrunt 

First of all terraform is a way to automate infrastructure deployement, it use infrastructure as a code [here](https://www.terraform.io/).

Lazy-terraform is a fast way to run terraform and terragrunt without installing them !

## How to run it !

```
docker run -it -v <terraform project folder>:/root/lazy-terraform docker.io/klemensgalus/lazy-terraform:<tag> bash
```
