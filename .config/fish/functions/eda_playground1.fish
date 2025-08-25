# ~/.config/fish/functions/eda_playground.fish

function eda_playground1
    # --- 变量定义 ---
    # 使用 set 来定义变量
    set VCS_HOME $EDA_HOME/synopsys/vcs/W-2024.09-SP1
    set VERDI_HOME $EDA_HOME/synopsys/verdi/W-2024.09-SP1
    set APPEND_PATH $VCS_HOME/bin
    set VCS_ARCH_OVERRIDE linux
    set UVM_HOME $HOME/EDAWorkbench/uvm-1.2

    # --- 参数检查 ---
    # 使用 (count $argv) 检查参数数量
    if test (count $argv) -eq 0
        echo 在配置好的eda环境中运行相关程序
        echo "用法: eda_playground <参数>"
        echo "示例: eda_playground vcs -full64 ..."
        return 1
    end

    # --- 条件逻辑 ---
    # 使用 if/else/end 结构
    set SHARE_NET ""
    if test "$argv[1]" = verdi
        set SHARE_NET --share-net
    end
    echo $SHARE_NET

    # --- 主命令 ---
    # bash 的 "$@" 在 fish 中是 $argv
    # 注意把路径替换成你自己的
    bwrap --bind /home/sfangyy/work/9-dependency/EDAWorkbench/almalinux9-rootfs / \
        --proc /proc \
        --dev /dev \
        /bin/bash
end
