# Microsoft SQL Server Replication

Copy the template variables file:

```sh
cp config/template.tfvars .auto.tfvars
```

Set your IP address in the `allowed_ip_address` variable.

Create the infrastructure:

```sh
terraform init
terraform apply -auto-approve
```

## SQL Server installation

Select the respective SQL Server version. Evaluation links:

- [SQL Server 2022 Evaluation](https://www.microsoft.com/en-us/evalcenter/evaluate-sql-server-2022)
- [SQL Server 2019 Evaluation](https://www.microsoft.com/en-us/evalcenter/evaluate-sql-server-2019)

Create a new database to be used for replication.

If the Replication feature is not selected on installed, it need to be added using **SQL Server Installation Center**.

The installation media should be like this: `C:\SQL2019\Evaluation_ENU`.

## Replication

With the Replication feature enabled, proceed the setup.

For testing purposes, the `Publisher` can act as its own `Distributor`.

```mermaid
flowchart LR
    P(Publisher) --> D(Distributor)
    D --> S(Subscriber)
```
