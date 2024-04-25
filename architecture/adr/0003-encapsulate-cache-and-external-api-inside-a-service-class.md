# 3. Encapsulate cache and external API inside a service class

Date: 2024-04-25

## Status

Accepted

## Context

Caching API responses by zip code is part of the requirements for this project.  Additionally the client is still deciding on which external API they'd like to use, so there are multiple possibilities for what shape the API response will have.  The designs show an indicator for whether the data is "fresh" or cached, which we will need to support.

## Decision

Access to weather data will be encapsulated in a service class, e.g. `WeatherService`, de-coupling application and UI concerns from the details of whichever API we end up using.

## Consequences

Reduces the impact of not having a decision on the API to use, i.e. changes should only need to be made to `WeatherService` and not to code depending on it.

Increased flexibility: Makes it easier to switch APIs at a later date. Caching technology will also be easier to switch at a later date, if desired.

It is more difficult to bypass the cache accidentally since calling code won't be responsible for checking it.

The `WeatherService` is responsible for letting calling code know if data is from the cache or not.
