# Sugar Mill Transportation Management System

## Introduction

Welcome to the Sugar Mill Transportation Management System, a Ruby on Rails web application designed for managing transportation logistics within a sugar mill environment.

## Features

- **Dispatch Management**: Track and manage dispatches from trucks to various locations.
- **Truck Management**: Maintain information about trucks including license plates and capacities.
- **Location Management**: Manage locations such as barangays and towns.
- **Driver Management**: Keep track of drivers, their assignments, and roles.
- **Planter Management**: Track information about planters including names and contact details.

## Getting Started

### Prerequisites

Ensure you have the following installed:

- Ruby (version 2.7 or higher)
- Rails (version 6.1 or higher)
- PostgreSQL database
- Yarn package manager

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/mocz/TruckManagement.git
   cd tms

2. Install dependencies:

    bundle install
    yarn install

3. Set up the database:

    rails db:create
    rails db:migrate

### Configuration

    Configure environment variables by renaming .env.example to .env and adjusting settings as needed.

Usage

### Start the server:

rails server

Access the application at http://localhost:3000 in your web browser.
### Directory Structure

    app/            # Contains controllers, models, views, assets
    |- controllers/
    |- models/
    |- views/
    |- assets/
    config/         # Configuration files (database, routes, environment)
    db/             # Database migrations and schema
    public/         # Publicly accessible files (images, stylesheets)
    test/           # Test files (RSpec, integration tests)
    ...

## Contributing

Contributions are welcome! Follow these steps to contribute:

    Fork the repository.
    Create a new branch (git checkout -b feature-branch).
    Make your changes, commit (git commit -am 'Add new feature'), and push to the branch (git push origin feature-branch).
    Create a new Pull Request.

## License

This project is licensed under the MIT License. See the LICENSE file for details.