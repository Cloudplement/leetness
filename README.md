# Leetness

A 1337 speak API.

Leetness is a Sinatra app that translates english to 1337 speak using the [Leetize](https://github.com/Cloudplement/leetize) gem.

## Resource URL

*http://localhost:4567/api/v1/leetize.json*

## Resourse Information

- Response format: JSON
- Requires authentication? No
- Rate limited? No

## Parameters

| Name | Required | Description                        | Example |
| ---- | -------- | ---------------------------------- | ------- |
| q    | required | The text you want translated to 1337 speak. You can include alphanumeric characters and symbols. Only vowels and consonants 'S' and 'T' are converted to to 1337 speak. | Hello World  |

## Example Request

GET http://localhost:4567/api/v1/leetize.json?q=Hello%20world

## Example Response

```json
{
  query: "Hello world",
  translation: "h3ll0 w0rld"
}
```

## Getting Started

1. Download or clone git repository:

```bash
$ git clone https://github.com/Cloudplement/leetness.git
```

2. Install dependencies:

```bash
$ cd leetness
$ bundle install
```

3. Run application:

```bash
$ rackup -p 4567
```

4. Translate using a GET request:

```bash
$ curl "http://localhost:4567/api/v1/leetize.json?q=Hello%20world"
> {"query":"Hello world","translation":"h3ll0 w0rld"}
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Cloudplement/leetness.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
