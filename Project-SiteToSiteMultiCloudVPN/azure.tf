provider "azurerm" {

    features{}

}

resource "azurerm_resource_group" "resource_group"{

    name = "resource_group"
    location = "westeurope"
}


resource "azurerm_virtual_network" "vnet"{

    name="vnet"
    location = azurerm_resource_group.resource_group.location

    resource_Group_name= azurerm_resource_group.resource_group.name
    address_space=["10.0.0.0/16"]

}

resource "azurerm_subnet" "subnet_1"{
    name= "subnet_1"
    resource_Group_name= azurerm_resource_group.resource_group.name
    address_prefix="10.0.1.0/24"
}

resource "azurerm_subent" "subnet_gatewy"{

    name = "GatewaySubnet"
    resource_Group_name= azurerm_resource_group.resource_group.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefix="10.0.2.0/24"
}

resource "azurerm_public_ip" "public_ip_1"{
    name = "virutal_network_gateway_public_ip_1"
    location = azurerm_resource_group.resource_group.location
    resource_Group_name= azurerm_resource_group.resource_group.name 
    allocation_method = "Dynamic"
}

resource "azurerm_public_ip" "public_ip_2"{
    name = "virutal_network_gateway_public_ip_2"
    location = azurerm_resource_group.resource_group.location
    resource_Group_name= azurerm_resource_group.resource_group.name 
    allocation_method = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "virtual_network_gateway"{

    name="virtual_network_gateway"
    location = azurerm_resource_group.resource_group.location
    resource_Group_name= azurerm_resource_group.resource_group.name 

    type="Vpn"
    vpn_type="RouteBased"

    active_active=true 
    sku = "VpnGw1"

    ip_configuration{
        name =azurerm_public_ip.public_ip_1.name
        public_ip_address_id=azurerm_public_ip.public_ip_1.id

        private_ip_address_allocation="Dynamic"
        subnet_id=azurerm_subnet.subnet_gateway.id

    }

    ip_configuration{
        name =azurerm_public_ip.public_ip_2.name
        public_ip_address_id=azurerm_public_ip.public_ip_2.id

        private_ip_address_allocation="Dynamic"
        subnet_id=azurerm_subnet.subnet_gateway.id

    }

}


resource "azurerm_local_network_gateway" "local_network_gateway_1_tunnel1"{

    name="local_network_gateway_1_tunnel1"

    location=azurerm_resource_group.resource_group.location

    resouce_group_name=azurerm_resource_group.resource_group.name

    gateway_address=aws_vpn_connection.vpn_connection_1.tunnel1_address

    address_space=[aws_vpc.vpc.cidr_block]
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_1_tunnel1"{

    name= "virtual_network_gateway_connection_1_tunnel1"
    location =azurerm_resource_group.resource_group.location
    resouce_group_name=azurerm_resource_group.resource_group.name

    type="IPSec"

    virtual_network_gateway_id=azurerm_virtual_network_gateway.virtual_network_gateway.id

    local_network_gateway_id=azurerm_local_network_gateway.local_network_gateway_1_tunnel1.id

    shared_key=aws_vpn_connection.vpn_connection_1.tunnel1_preshared_key
}

resource "azurerm_local_network_gateway" "local_network_gateway_1_tunnel2"{

    name="local_network_gateway_1_tunnel2"

    location=azurerm_resource_group.resource_group.location

    resouce_group_name=azurerm_resource_group.resource_group.name

    gateway_address=aws_vpn_connection.vpn_connection_1.tunnel2_address

    address_space=[aws_vpc.vpc.cidr_block]
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_1_tunnel2"{

    name= "virtual_network_gateway_connection_1_tunnel2"
    location =azurerm_resource_group.resource_group.location
    resouce_group_name=azurerm_resource_group.resource_group.name

    type="IPSec"

    virtual_network_gateway_id=azurerm_virtual_network_gateway.virtual_network_gateway.id

    local_network_gateway_id=azurerm_local_network_gateway.local_network_gateway_1_tunnel2.id

    shared_key=aws_vpn_connection.vpn_connection_1.tunnel2_preshared_key
}


resource "azurerm_local_network_gateway" "local_network_gateway_2_tunnel1"{

    name="local_network_gateway_2_tunnel1"

    location=azurerm_resource_group.resource_group.location

    resouce_group_name=azurerm_resource_group.resource_group.name

    gateway_address=aws_vpn_connection.vpn_connection_1.tunnel1_address

    address_space=[aws_vpc.vpc.cidr_block]
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_2_tunnel1"{

    name= "virtual_network_gateway_connection_2_tunnel1"
    location =azurerm_resource_group.resource_group.location
    resouce_group_name=azurerm_resource_group.resource_group.name

    type="IPSec"

    virtual_network_gateway_id=azurerm_virtual_network_gateway.virtual_network_gateway.id

    local_network_gateway_id=azurerm_local_network_gateway.local_network_gateway_2_tunnel1.id

    shared_key=aws_vpn_connection.vpn_connection_2.tunnel1_preshared_key
}

resource "azurerm_local_network_gateway" "local_network_gateway_2_tunnel2"{

    name="local_network_gateway_2_tunnel2"

    location=azurerm_resource_group.resource_group.location

    resouce_group_name=azurerm_resource_group.resource_group.name

    gateway_address=aws_vpn_connection.vpn_connection_2.tunnel2_address

    address_space=[aws_vpc.vpc.cidr_block]
}

resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection_2_tunnel2"{

    name= "virtual_network_gateway_connection_2_tunnel2"
    location =azurerm_resource_group.resource_group.location
    resouce_group_name=azurerm_resource_group.resource_group.name

    type="IPSec"

    virtual_network_gateway_id=azurerm_virtual_network_gateway.virtual_network_gateway.id

    local_network_gateway_id=azurerm_local_network_gateway.local_network_gateway_2_tunnel2.id

    shared_key=aws_vpn_connection.vpn_connection_2.tunnel2_preshared_key
}
