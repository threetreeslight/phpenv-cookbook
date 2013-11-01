phpenv-cookbook Cookbook
========================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwhich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - phpenv-cookbook needs toaster to brown your bagel.

Attributes
----------
TODO: List you cookbook attributes here.

#### phpenv-cookbook::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['phpenv-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### phpenv-cookbook::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `phpenv-cookbook` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[phpenv-cookbook]"
  ]
}
```

Test
----

require

* ruby 2.0.0-p247
  * chef-solo gem
  * bundler gem
* vagrant
* virtual box

setting

```
# configure setting
$ knife configure

# up to virtualbox
$ vagrant up
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
