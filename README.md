# fcm

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  fcm:
    github: 9to6/fcm
```

## Usage

```crystal
require "fcm"

fcm = Fcm::Fcm.new("api-token")
# fcm.send(registration_ids: ["4sdsx", "8sdsd"], {data: {score: "5x1"}})
fcm.send(["4sdsx", "8sdsd"], {data: {score: "5x1"}}.to_h)

fcm.send_to_topic("news")
```
