# Event Standardizer
A variety of traditional and [Event Processing Applications](../event-processing/event-processing-application.md) will need to exchange [Events](../event/event.md) across [Event Streams](../event-stream/event-stream.md). Downstream Event Processing Applications will require standardized data formats in order to properly process Events of different formats.

## Problem
How do I process events that are semantically equivalent, but arrive in different formats?

## Solution
![event-standardizer](../img/event-standardizer.png)

Source all the input Event Streams into an Event Standardizer which routes Events to a specialized [Event Translator](../event-processing/event-translator.md) which converts the Event to a normalized form expected by the downstream [Event Processors](../event-processing/event-processor.md).

## Implementation
A [Kafka Streams](https://kafka.apache.org/documentation/streams/) [Toplogy](https://docs.confluent.io/platform/current/streams/architecture.html#processor-topology) can read from multiple input Event Streams and `map` the values to a new type. This `map` function can act as the event router, directing the Event to the proper [Event Translator](../event/event-translator.md) before forwading it to the output stream using the `to` function.

```
SpecificAvroSerde<SpecificRecord> inputValueSerde = ...
builder
  .stream(List.of("inputStreamA", "inputStreamB", "inputStreamC"),
    Consumed.with(Serdes.String(), inputValueSerde))
  .mapValues((k, v) -> {
    if (v.getClass() == TypeA.class)
      return typeATranslator.normalize(v);
    else if (v.getClass() == TypeB.class)
      return typeBTranslator.normalize(v);
    else if (v.getClass() == TypeC.class)
      return typeCTranslator.normalize(v);
    else {
      // exception or dead letter stream
    }
  })
  .to("outputStream", Produced.with(Serdes.String(), outputSerdeType);
```

## Considerations
TODO: Technology specific reflection on implmenting the pattern 'in the real world'. Considerations may include optional subsequent decisions or consequences of implementing the pattern.

## References
* This pattern is derived from [Normalizer](https://www.enterpriseintegrationpatterns.com/patterns/messaging/Normalizer.html) in Enterprise Integration Patterns by Gregor Hohpe and Bobby Woolf
* Kafka Streams [`map` stateless transformation](https://docs.confluent.io/platform/current/streams/developer-guide/dsl-api.html#creating-source-streams-from-ak) documentation
