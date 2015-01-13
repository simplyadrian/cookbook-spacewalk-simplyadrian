spacewalk-nativex Cookbook
================================
This cookbook is used to install, configure, and register the SpaceWalk client on a node.

It is also used to configure SpaceWalk server.


Requirements
------------
This cookbook depends on the cron community cookbook.
Depends on the epel yum repository. You can add "include_recipe 'yum-nativex'" to your role to achieve this.

Recipes
-------
#### default.rb
Calls spacewalk-nativex::clientinstall and spacewalk-nativex::registerclient

#### clientinstall.rb
Installs the spacealk client.

#### registerclient.rb
Runs bash script to register the node with SpaceWalk server using the appropriate activation key (configurable in a
node attribute.

#### clone_package_channels.rb
Copies the channel_cloner.erb template to the node and schedules it using cron. The channel_cloner ruby script
is designed to update the package channels on a SpaceWalk satellite server when given the appropriate
input (via attributes).

Attributes
----------
#### spacewalk-nativex::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['spacewalk-nativex']['update_prod']</tt></td>
    <td>Boolean</td>
    <td>Used when configuring SpaceWalk server. If set to true, Clones/Merges Dev channel packages into Prod
      channel</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['spacewalk-nativex']['backup_prod']</tt></td>
    <td>Boolean</td>
    <td>Used when configuring SpaceWalk server. If set to true, backs up Prod channel before cloning/merging Dev
      packages</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['spacewalk-nativex']['activation_key']</tt></td>
    <td>String</td>
    <td>Used when configuring SpaceWalk server. Channel activation key specifies which channel the client should be
      registered with</td>
    <td><tt>'1-centos6'</tt></td>
  </tr>
  <tr>
    <td><tt>['spacewalk-nativex']['excludes']</tt></td>
    <td>String</td>
    <td>Used when configuring SpaceWalk server. Excludes cloning packages for channel IDs specified, use "," to
      separate channels, exclude the dev-- or prod-- prefix</td>
    <td><tt>'dsc-centos,dse-centos'</tt></td>
  </tr>
</table>

Usage
-----
#### spacewalk-nativex::default
Just include `spacewalk-nativex` in your node's role or `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[spacewalk-nativex]"
  ]
}
```

License and Authors
-------------------
Authors: Adrian Herrera, Jesse Hauf
