# .bashrc.d

I always wanted a .d folder and this is my first.

It allows for a modular way of life and this is the way.

d stands for directory and i usually called dot-d or drop-in, but i will always call you my special little folder.

## My usage

I use this directory for loading small scripts, so i can just put it in or remove it without changing any other files.

I load it from .bashrc with this code:

```sh
if [[ -d "${HOME}/.bashrc.d" ]]; then
  for config in "${HOME}/.bashrc.d"/*.sh; do
    [[ -r "${config}" ]] && source "${config}"
  done
fi
```

It is good because it declutters the `.bashrc` file.

## Load order

From this folder it loads things from top down. If you dont care about load order then just add files to this folder. If you care then it usually solved by adding a number as a prefix (`10-a.sh`, `20-b.sh`). This way you have full control of the load order.

But you are not guaranteed that every application reads every file. Some only reads only the `*.conf` or `*.list`.

Perfect for scripts and configs or applications lika Ansible.

But you need to be aware of problems with syntax and permissions. It can easily break the whole thing.

Also they are not perfect so just changing a file in a .d directory dont mean it gets reloaded or something like that.

But dont listen to them my special little folder, you are perfect just the way you are.
