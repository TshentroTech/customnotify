# tshentro.tech Enhanced Notification System v2.0

A beautiful, modern notification system for FiveM servers using QBCore framework with advanced features including configurable positioning and advertisement system.

## 🌟 Features

- 🎨 Clean, modern design matching popular notification systems
- 🔧 Full QBCore integration with automatic compatibility
- 📍 **Configurable positioning** (9 different positions)
- 💰 **Advertisement system** with paid business promotions
- 🎵 Sound effects for different notification types
- ⚡ Lightweight and performant
- 📱 Fully responsive design
- 🎯 Queue system for multiple notifications
- ⏱️ Customizable duration and auto-dismiss
- 🎪 Smooth animations and micro-interactions

## 📦 Installation

1. Place the `customnotify` folder in your `resources` directory
2. Add `ensure customnotify` to your `server.cfg`
3. In your QBCore's client.lua file, add:
```lua
function QBCore.Functions.Notify(text, texttype, length)
    exports['customnotify']:notify(text, texttype, length);
end
```
4. Restart your server

## ⚙️ Configuration

Edit `config.lua` to customize the notification system:

### Position Settings
Choose from 9 different positions:
- `top-right` (default)
- `top-left`
- `top-center`
- `middle-right`
- `middle-left`
- `middle-center`
- `bottom-right`
- `bottom-left`
- `bottom-center`

### Advertisement System
```lua
Config.Advertisement = {
    enabled = true,
    cost = 1000, -- Cost per advertisement
    duration = 30000, -- 30 seconds
    maxLength = 150, -- Maximum characters
    cooldown = 300000, -- 5 minutes cooldown
    allowedJobs = { -- Jobs that can send ads
        'realestate',
        'cardealer',
        'mechanic',
        'lawyer'
    }
}
```

## 🚀 Usage

### QBCore Integration (Automatic)
All existing QBCore resources work automatically:
```lua
QBCore.Functions.Notify('Your message here', 'success', 5000)
QBCore.Functions.Notify('Error message', 'error')
QBCore.Functions.Notify('Warning message', 'warning', 7000)
```

### Direct Usage
```lua
-- Basic notification
exports['customnotify']:SendNotification({
    type = 'success',
    title = 'Success!',
    message = 'Your action was completed successfully.',
    duration = 5000,
    sound = true
})

-- Convenience functions
exports['customnotify']:NotifySuccess('Success!', 'Action completed!')
exports['customnotify']:NotifyError('Error!', 'Something went wrong!')
exports['customnotify']:NotifyInfo('Info', 'Here is some information.')
exports['customnotify']:NotifyWarning('Warning!', 'Be careful!')
```

### Advertisement System
Players with allowed jobs can send paid advertisements:
```lua
-- In-game command
/advertisement Your business message here

-- Server-side
exports['customnotify']:SendAdvertisement(playerId, message, businessName)
```

### Server-side Functions
```lua
-- Notify specific player
exports['customnotify']:NotifyPlayer(playerId, {
    type = 'info',
    title = 'Welcome!',
    message = 'Welcome to our server!'
})

-- Notify all players
exports['customnotify']:NotifyAll({
    type = 'warning',
    title = 'Server Restart',
    message = 'Server will restart in 5 minutes.'
})
```

## 🎨 Notification Types

- `success` - Green with check icon
- `error` - Red with exclamation icon  
- `warning` - Orange with warning icon
- `info` - Blue with info icon
- `announcement` - Purple with bullhorn icon (for advertisements)
- `bank` - Green with bank icon
- `server` - Gray with server icon

## 🎮 Commands

### Player Commands
- `/advertisement [message]` - Send a paid advertisement (requires allowed job)
- `/testnotify [type] [title] [message]` - Test notification (development)

### Admin Commands
- `/notifyall [type] [title] [message]` - Send notification to all players
- `/serverannouncement [message]` - Send server announcement

## 💡 Advertisement System Details

The advertisement system allows business owners to send server-wide notifications for a fee:

- **Cost**: Configurable (default: $1000)
- **Duration**: 30 seconds (configurable)
- **Cooldown**: 5 minutes between ads per player
- **Job Restrictions**: Only allowed jobs can send ads
- **Character Limit**: Configurable maximum message length
- **Payment**: Automatically deducted from bank account

### Allowed Jobs (Default)
- Real Estate Agents
- Car Dealers
- Mechanics
- Lawyers

## 🔧 Customization

### Changing Position
Edit `config.lua`:
```lua
Config.CurrentPosition = 'top-left' -- Change to desired position
```

### Adding New Notification Types
Edit `config.lua`:
```lua
Config.NotificationTypes['custom'] = {
    color = '#FF6B6B',
    icon = 'fas fa-custom-icon',
    sound = 'custom'
}
```

### Modifying Advertisement Settings
Edit the `Config.Advertisement` table in `config.lua` to adjust costs, duration, allowed jobs, etc.

## 📱 Responsive Design

The notification system automatically adapts to different screen sizes:
- Desktop: Full-sized notifications with all features
- Mobile: Compact notifications optimized for smaller screens
- Tablet: Medium-sized notifications with adjusted spacing

## 🎵 Sound Integration

The system includes sound effects for different notification types. Sounds are played using FiveM's native audio system.

## 🔒 Security Features

- Input sanitization to prevent XSS attacks
- Job-based permissions for advertisements
- Cooldown system to prevent spam
- Automatic money validation and deduction
- Rate limiting for notification display

## 📊 Performance

- Lightweight HTML/CSS/JS implementation
- Efficient notification queue management
- Automatic cleanup of expired notifications
- Minimal resource usage
- Optimized animations for smooth performance

## 🆕 Version 2.0 Changes

- Complete visual redesign matching modern notification systems
- Configurable positioning system (9 positions)
- Advertisement system with payment integration
- Enhanced animation system
- Improved responsive design
- Better QBCore integration
- Additional notification types
- Performance optimizations

## 🤝 Support

For support, issues, or feature requests, please contact tshentro.tech.

## 📄 License

This resource is created by tshentro.tech for FiveM QBCore servers.

---

**tshentro.tech** - Creating quality FiveM resources since 2025
