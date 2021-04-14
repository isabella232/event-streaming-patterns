# Event Filter
[Event Processors](event-processor.md) may need to operate over a subset of [Events](../event/event.md) over a particular [Event Stream](../event-stream/event-stream.md).

## Problem
How can an application discard uninteresting events?

## Solution
![event-filter](../img/event-filter.png)


## Implementation
The Kafka Streams DSL provides a `filter` operator which filters out events that do not match a given predicate.

```
KStream<String, Event> eventStream = builder.stream(.....);
eventStream.filter((key, value) -> value.type() == "foo").to("foo-events");
```

## References
* This pattern is derived from [Message Filter](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Filter.html) in Enterprise Integration Patterns by Gregor Hohpe and Bobby Woolf
* See this [Kafka Tutorial](https://kafka-tutorials.confluent.io/filter-a-stream-of-events/ksql.html) for a full example of filtering event streams.

