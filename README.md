# Welcome to lazy-terraform !

## Quick reference

-   **Maintained by**  
    [Me : Klemens](https://gitlab.com/Klemens_Galus)

## Supported release tags  
- [1.0.3](https://github.com/klemens-galus/lazy-terraform/tree/1.0.3)
- [1.0.2](https://github.com/klemens-galus/lazy-terraform/tree/1.0.2)
- [1.0.1](https://github.com/klemens-galus/lazy-terraform/tree/1.0.1)
- [1.0.0](https://github.com/klemens-galus/lazy-terraform/tree/1.0.0)

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
docker run -it -v <terraform project folder>:/home/terraform/lazy-terraform docker.io/klemensgalus/lazy-terraform:<tag> bash
```
       