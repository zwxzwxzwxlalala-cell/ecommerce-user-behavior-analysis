# 电商用户行为分析

## 项目简介
基于 Kaggle 电商平台 2019年11月 **6750万条**用户行为数据，
使用 MySQL + Python + Power BI 完成完整业务分析。

## 使用工具
- MySQL：数据存储、清洗、聚合
- Python：数据分析、可视化（pandas / matplotlib）
- Power BI：交互式仪表盘

## 项目结构
ecommerce-user-behavior-analysis/
├── README.md
├── sql/                        # 建表SQL脚本
├── notebook/                   # Python分析代码
└── dashboard/                  # Power BI仪表盘
## 分析模块
- 用户行为漏斗分析（事件级 + 会话级）
- 每日销售趋势分析
- 24小时用户活跃度分析
- 品类销售分析
- RFM 用户分层模型

## 核心结论
- 会话级整体转化率 **5.62%**，加购后购买率 **44.35%**
- 11月17日促销峰值达平日订单量的 **6倍**
- 用户存在"16点浏览、9点下单"的延迟决策行为
- electronics 品类贡献全平台 **74.6%** 销售额
- 高价值用户6万人均消费 **1949元**
- 流失预警用户9万人均消费 **633元**，具有高召回价值

## 运行说明
1. 在本地创建 `.env` 文件，写入 `DB_PASSWORD=你的数据库密码`
2. 运行 `notebook/ecommerce_analysis.ipynb`
