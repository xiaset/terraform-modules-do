# Copyright (C) 2019-2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#####################################################################""
# Provider


############################################################################
# Kubernetes

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "region" {
  type        = string
  description = "The location of the cluster"
}

variable "tags" {
  description = "The list of instance tags applied to the cluster."
  type        = list(any)
  default     = ["kubernetes"]
}

variable "kubernetes_version" {
  type        = string
  description = "The Kubernetes version"
}

variable "maintenance_policy_start_time" {
  type        = string
  description = "The start time in UTC of the maintenance window policy in 24-hour clock format / HH:MM notation"
}

variable "maintenance_policy_day" {
  type        = string
  description = "The day of the maintenance window policy"
}

variable "size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
}

variable "max_nodes" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "node_count" {
  type        = number
  description = "The number of Droplet instances in the node pool."
}

variable "min_nodes" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "auto_scale" {
  description = "Enable cluster autoscaling"
  type        = bool
}

variable "auto_upgrade" {
  type        = bool
  description = "Whether the cluster will be automatically upgraded"
}

variable "node_labels" {
  description = "List of Kubernetes labels to apply to the nodes"
  type        = map(any)
  default = {
    "service" = "kubernetes"
  }
}

variable "node_tags" {
  description = "The list of instance tags applied to all nodes."
  type        = list(any)
  default     = ["kubernetes"]
}

variable "vpc_uuid" {
  type        = string
  default     = ""
  description = "The ID of the VPC where the Kubernetes cluster will be located"
}

#############################################################################
# Addons node pool

variable "node_pools" {
  description = "Addons node pools"
  type = map(object({
    size        = string
    node_count  = number
    auto_scale  = bool
    min_nodes   = number
    max_nodes   = number
    node_tags   = list(string)
    node_labels = map(string)
    taints      = optional(list(object({ // Use optional and list of objects for flexibility
      key    = string
      value  = string
      effect = string
    })), []) // Default to an empty list if not provided
  }))
  default = {}
}

variable "do_project" {
  description = "Name of the DO project to assign resources"
  type        = string
}

variable "ha" {
  type        = bool
  default     = false
  description = "Enable/disable the high availability control plane for a cluster. High availability can only be set when creating a cluster. Any update will create a new cluster"
}
