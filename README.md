# Foundry Demo

## Foundry 主要组成部分及功能

### Forge

Forge 是 Foundry 的核心测试框架，用于编译、测试和部署智能合约。主要功能包括：

- **编译合约**: 使用 `forge build` 编译 Solidity 合约
- **运行测试**: 使用 `forge test` 执行测试套件，支持 fuzz 测试和 invariant 测试
- **代码格式化**: 使用 `forge fmt` 格式化 Solidity 代码
- **Gas 分析**: 使用 `forge snapshot` 生成 gas 使用快照，帮助优化合约
- **部署脚本**: 使用 `forge script` 编写和执行部署脚本
- **调试功能**: 内置强大的调试工具，支持堆栈跟踪和错误信息

### Cast

Cast 是一个命令行工具，用于与 EVM 智能合约交互。主要功能包括：

- **调用合约**: 读取合约状态和执行只读函数
- **发送交易**: 向合约发送交易并执行状态改变操作
- **数据编码/解码**: 对函数调用、事件等进行 ABI 编码和解码
- **链上数据查询**: 获取区块信息、交易详情、账户余额等
- **单位转换**: 在不同单位之间转换（wei, gwei, ether 等）
- **签名验证**: 验证消息签名和交易签名

### Anvil

Anvil 是一个本地以太坊节点，用于开发和测试。主要功能包括：

- **本地网络**: 快速启动本地以太坊网络，无需同步主网数据
- **账户管理**: 自动创建测试账户并预分配 ETH
- **分叉主网**: 可以分叉主网或测试网，在本地环境中测试真实合约交互
- **挖矿控制**: 可以手动或自动挖矿，控制区块生成速度
- **状态快照**: 支持创建和恢复网络状态快照，方便测试回滚
- **RPC 接口**: 提供标准的 JSON-RPC 接口，兼容其他工具

### Chisel

Chisel 是一个 Solidity REPL（交互式解释器），用于快速测试和实验。主要功能包括：

- **即时执行**: 快速执行 Solidity 代码片段，无需创建完整项目
- **语法测试**: 快速验证 Solidity 语法和功能
- **学习工具**: 用于学习和理解 Solidity 语言特性
- **原型开发**: 在正式开发前快速验证想法和概念

## 文档

https://book.getfoundry.sh/

## 部署

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```
