# Traceroute Monitor

## Description

Traceroute Monitor is a tool designed to monitor network routes for various IP addresses and websites. It updates every 10 minutes to detect and indicate route changes. This project uses Elixir and Phoenix to provide a user-friendly web interface and robust database management capabilities.

## Features

- **Traceroute Monitoring**: Track network routes for various IP addresses and websites.
- **Route Change Detection**: Updates every 10 minutes to detect route changes.
- **CRUD Management**: Full management of categories, hosts, traceroutes, and traceroute hops.
- **Web Interface**: User interface built with Phoenix for easy interaction.

## Prerequisites

- Elixir 1.16.3
- Phoenix Framework

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Hadriellamy/Traceroute.git
    cd Traceroute
    ```

2. Install the dependencies:
    ```sh
    mix deps.get
    ```

3. Create and set up your database:
    ```sh
    mix ecto.create
    mix ecto.migrate
    ```

4. Start the Phoenix server:
    ```sh
    mix phx.server
    ```

5. Access the application at [http://localhost:4000](http://localhost:4000).

## Usage

1. Add new IP addresses and websites to monitor via the web interface.
2. View traceroute results and monitor route changes in real-time.

## Database Schema

### Host
- `name`: Host name
- `ip`: Host IP address
- `address`: Host address
- `category_id`: Reference to the category

### Traceroute
- `host_id`: Reference to the host
- `inserted_at`: Timestamp of creation
- `updated_at`: Timestamp of update

### TracerouteHop
- `order`: Order of the hop
- `host`: Host of the hop
- `loss`: Packet loss
- `snt`: Packets sent
- `avg`: Average latency
- `traceroute_id`: Reference to the traceroute

### Category
- `name`: Category name

---

Developed by [Hadriel Lamy](https://github.com/Hadriellamy)
