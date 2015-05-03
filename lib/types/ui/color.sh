import ../base/Object

# Don't import colors on pipes or non-recognized terminals
UI.Color.IsAvailable && static:UI.Color() {
    extends Object

#    UI.Color.IsAvailable() {
#        # TODO: @@verify ## adds a ternary operator
#
#        if [[ "${TERM}" != *"xterm"* ]] || [ -t 1 ]; then
#            # Don't use colors on pipes or non-recognized terminals
#            return 1
#        else
#            return 0
#        fi
#    }

    UI.Color.Print() {
        @mixed colorCode
        @@verify

        if UI.Color.IsAvailable
        then
            local colorString="\$'\033[${colorCode}m'"
            eval echo "${colorString}"
        else
            echo
        fi
    }

    UI.Color.256text() {
        @mixed colorNumber
        @@verify

        if UI.Color.IsAvailable
        then
            local colorString="\$'\033[38;5;${colorNumber}m'"
            eval echo "${colorString}"
        else
            echo
        fi
    }

    UI.Color.256background() {
        @mixed colorNumber
        @@verify

        if UI.Color.IsAvailable
        then
            local colorString="\$'\033[48;5;${colorNumber}m'"
            eval echo "${colorString}"
        else
            echo
        fi
    }
}
