# Itamae Recipes 

for CentOS 7.

## Roles / Cookbooks
- Deploy
    - Fabric
- Provision
    - Ansible
- Task Runner
    - Jenkins
- Parallel-SSH
    - pssh ( w/ pscp, prsync, pslurp, pnuke )

## Execute Sample
### Installation
```
cd ${itamae_dir}
itamae ssh -h 192.168.33.31 -i /path/to/private_key roles/deploy.rb -u vagrant --dry-run

(same as:) 
itamae ssh -h 192.168.33.31 -i /path/to/private_key cookbooks/fabric/default.rb -u vagrant --dry-run
```

### Serverspec Test
- Create spec code automatically
```
bundle exec serverspec-init
・・・
```

- (Prepare ~/.ssh/config)
```
Host personal-centos
  HostName 192.168.33.31
  Port 22
  User vagrant
  IdentityFile ~/.ssh/private_key
```

- Execute Test
```    
cd ${itamae_dir}
rake spec
```

## Refs:
- http://sogaoh.hatenablog.com/entry/2016/12/31/120328
- http://itamae.kitchen/
- https://github.com/itamae-kitchen/itamae/wiki
- http://serverspec.org/
- http://carefree-se.hatenablog.com/entry/2015/06/10/142533
- http://qiita.com/uedatakeshi/items/322a94d6f5b0a4bdcdb5
