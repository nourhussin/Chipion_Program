# SBqM (Safebank Queue Monitoring) Project


Welcome to the SBqM project repository. SBqM, short for Safebank Queue Monitoring, is an embedded system designed to monitor client queues at the Safebank branch. This repository contains all the resources and code related to the SBqM project.

## Project Overview

The SBqM system aims to provide real-time monitoring and display of important queue-related information at the Safebank branch. It helps bank staff manage customer queues efficiently by providing the following features:

- Queue status monitoring using photocells at both ends.
- Tracking the number of clients in the queue (Pcount).
- Calculating and displaying the expected waiting time (Wtime).
- Maintaining binary flags for queue fullness and emptiness.
- A reset feature to clear the system.

## Project Components

The SBqM project is divided into several components:

1. **ROM**: Contains the information needed in calculating the waiting time Wtime.

2. **Queue Status**: Provides infomation about the status of the queue (full, empty, and occupied).

3. **Up-Down Counter**: Model for the up-down counter used to generate Pcount.

4. **Calcuation Controller**: Generating the Rom enable signal based on Pcount.


