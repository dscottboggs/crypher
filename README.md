# crypher

WIP library for super-simple symmetric encryption in Crystal

**WORK IN PROGRESS**: Do not use `Crypher::Encrypter` or `Crypher::Decryptor` yet! Only one-shot String and Slice encryption works at this stage

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     crypher:
       github: dscottboggs/crypher
   ```

2. Run `shards install`

## Usage

```crystal
require "crypher"

context = Crypher.new
encrypted_string = "some super secret text".encrypt context
encrypted_string.decrypt context # => "some super secret text"

# Using Crypher.global context
encrypted = "some secret text".encrypt
encrypted.decrypt # => "some secret text"
```

## Contributing

1. Fork it (<https://github.com/dscottboggs/crypher/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [D. Scott Boggs](https://github.com/dscottboggs) - creator and maintainer
