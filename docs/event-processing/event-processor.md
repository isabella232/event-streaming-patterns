# Event Processor
An event processor is a component of a larger [Event Processing Application](event-processing-application.md).  The event processor applies discrete, idempotent operations to an event object.

## Problem
How do I gain insight from event data? For example, how can I quickly address a customer issue?

## Solution
![event-processor](../img/event-processor.png)
You can define any number of event processors inside an [Event Processing Application](event-processing-application.md) to perform such tasks as mapping an event type to a domain object, triggering alerts, real-time report updates, and writing out results for consumption by other applications.

## Implementation

```
StreamsBuilder builder = new StreamsBuilder();
        KStream<String, String> stream = builder.stream("input-events");
        stream.filter((key, value)-> value.contains("special-code"))
              .mapValues(value -> to domain object)
              .to("special-output-events");
```

## Considerations

While it could be tempting to build a "multi-purpose" event processor, it's important that processor performs a discrete, idempotent action.  By building processors this way, it's easier to reason about what each processor does and by extension what the application does. 


## References
* TODO: Reference link to the EIP pattern as citation
* TODO: pointers to related patterns?
* TODO: pointers to external material?
