PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

function loadlib() {
        lib=${1:?"You have toq specify a library file"}
        if [ -f "$lib" ];then
                . "$lib"
        fi
}
