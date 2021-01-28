module "dev" {
    source="./environments/dev"

}

module "stage" {
    source="./environments/stage"

}

module "prod" {
    source="./environments/prod"

}