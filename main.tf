#Root module

module "vpc" {
    source = "./vpc" 
}

module "ec2" {
    source = "./ec2"
    sn = module.vpc.pb_sn
    sg = module.vpc.sg
}
