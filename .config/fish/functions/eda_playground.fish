# ~/.config/fish/functions/eda_playground.fish

function eda_playground
    # --- 变量定义 ---
    # 使用 set 来定义变量
    set VCS_HOME $EDA_HOME/synopsys/vcs/W-2024.09-SP1
    set VERDI_HOME $EDA_HOME/synopsys/verdi/W-2024.09-SP1
    set APPEND_PATH $VERDI_HOME/bin $VCS_HOME/bin
    set VCS_ARCH_OVERRIDE linux
    set UVM_HOME $HOME/EDAWorkbench/uvm-1.2

    set APPEND_PATH_STRING (string join ":" $APPEND_PATH)
    # # --- 参数检查 ---
    # # 使用 (count $argv) 检查参数数量
    # if test (count $argv) -eq 0
    #     echo 在配置好的eda环境中运行相关程序
    #     echo "用法: eda_playground <参数>"
    #     echo "示例: eda_playground vcs -full64 ..."
    #     return 1
    # end
    #
    # --- 条件逻辑 ---
    # # 使用 if/else/end 结构
    # set SHARE_NET ""
    # if test "$argv[1]" = verdi
    #     set SHARE_NET --share-net
    # end
    #
    if test "$argv[1]" = verdi
        set SHARE_NET --share-net --setenv HOME $HOME
    else
        set SHARE_NET --setenv HOME $HOME
    end

    #echo $SHARE_NET
    # --- 主命令 ---
    # bash 的 "$@" 在 fish 中是 $argv
    bwrap --bind /home/sfangyy/work/9-dependency/EDAWorkbench/almalinux9-rootfs / \
        --bind $HOME $HOME \
        --ro-bind /etc/passwd /etc/passwd \
        --ro-bind /etc/group /etc/group \
        --dev-bind /dev /dev \
        --proc /proc \
        --tmpfs /tmp \
        --tmpfs /run \
        --ro-bind /sys/dev/char /sys/dev/char \
        --ro-bind /sys/devices /sys/devices \
        --ro-bind /run/dbus /run/dbus \
        --setenv WAYLAND_DISPLAY "$WAYLAND_DISPLAY" \
        --ro-bind "$XDG_RUNTIME_DIR" "$XDG_RUNTIME_DIR" \
        --ro-bind /tmp/.X11-unix /tmp/.X11-unix \
        --clearenv \
        --setenv HOME $HOME \
        --setenv LINUX_VMR_OS linux \
        --setenv VCS_HOME $VCS_HOME \
        --setenv VCS_ARCH_OVERRIDE linux \
        --setenv UVM_HOME $UVM_HOME \
        --setenv VCS_UVM_HOME $UVM_HOME/src \
        --setenv DISPLAY $DISPLAY \
        --setenv PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$APPEND_PATH_STRING \
        --unshare-all \
        $SHARE_NET \
        --die-with-parent \
        $argv # 使用 $argv 传递所有参数
end
