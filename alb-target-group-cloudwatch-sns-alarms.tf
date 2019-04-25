module "alb_target_group_alarms" {
  enabled                        = "${local.enabled && var.alb_target_group_alarms_enabled == "true" ? "true" : "false"}"
  source                         = "git::https://github.com/cloudposse/terraform-aws-alb-target-group-cloudwatch-sns-alarms.git?ref=tags/0.5.0"
  name                           = "${var.name}"
  namespace                      = "${var.namespace}"
  stage                          = "${var.stage}"
  attributes                     = "${var.attributes}"
  alarm_actions                  = ["${var.alb_target_group_alarms_alarm_actions}"]
  ok_actions                     = ["${var.alb_target_group_alarms_ok_actions}"]
  insufficient_data_actions      = ["${var.alb_target_group_alarms_insufficient_data_actions}"]
  alb_name                       = "${var.alb_name}"
  alb_arn_suffix                 = "${var.alb_arn_suffix}"
  target_group_name              = "${data.aws_lb_target_group.default.arn}"
  target_group_arn_suffix        = "${data.aws_lb_target_group.default.arn_suffix}"
  target_3xx_count_threshold     = "${var.alb_target_group_alarms_3xx_threshold}"
  target_4xx_count_threshold     = "${var.alb_target_group_alarms_4xx_threshold}"
  target_5xx_count_threshold     = "${var.alb_target_group_alarms_5xx_threshold}"
  target_response_time_threshold = "${var.alb_target_group_alarms_response_time_threshold}"
  period                         = "${var.alb_target_group_alarms_period}"
  evaluation_periods             = "${var.alb_target_group_alarms_evaluation_periods}"
}
