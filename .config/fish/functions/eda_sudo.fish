function eda_sudo
    # 注意：这里假设 sudo 密码已经缓存，或者你有免密权限
    # 否则在函数中直接调用 sudo 可能会有交互问题
    sudo -E bwrap --bind /home/sfangyy/work/9-dependency/EDAWorkbench/almalinux9-rootfs / \
        --dev-bind /dev /dev \
        --ro-bind /etc/resolv.conf /etc/resolv.conf \
        --proc /proc \
        --tmpfs /tmp \
        --tmpfs /run \
        --setenv PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
        --share-net \
        --die-with-parent \
        bash
end
