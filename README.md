# FiveM Tablet
Deze tablet is ontworpen voor de perfecte samenwerking met het MEOS van PerdonIT.
Om fouten te voorkomen is het belangrijk dat je geen aanpassing doet in het script en de installatie instructies goed volgt.

Mocht je zelf aanpassingen willen zien in het script kan je een [Pull Request](https://github.com/PerdonIT/fivem-tablet/pulls) of [Issue](https://github.com/PerdonIT/fivem-tablet/issues) openen.

Voor vragen kan je de Discord server joinen: https://discord.gg/r6fNJcSP3E .

### Installatie
1. Zorg dat je een MEOS account hebt op https://perdonit.nl
2. Download de source-code( https://github.com/PerdonIT/fivem-tablet/releases/ )
3. Zorgt dat de resource naam `meos` is
4. Zet de resource automatisch aan in je `server.cfg` (`start meos`)

### Hoe werkt het?
1. Je kan de tablet openen met het `/meos` command
2. Om de tablet weer te sluiten moet je op `esc` klikken 

### Kan ik ook client-events gebruiken om de tablet te openen?
Je kan het `perdonit:meos:setvisible` event aanroepen om de tablet te openen of te sluiten. 

Voorbeeld code:
```
-- Meos openen
RegisterCommand("openmeos", function(source, args, rawCommand)
    TriggerEvent('perdonit:meos:setvisible', true)
end, false)

-- Meos sluiten
RegisterCommand("sluitmeos", function(source, args, rawCommand)
    TriggerEvent('perdonit:meos:setvisible', false)
end, false)
```

### Screenshots
![Screenshot](https://cdn.discordapp.com/attachments/825106108926263349/825118307404349450/unknown.png)
![Screenshot](https://cdn.discordapp.com/attachments/825106108926263349/825118707931938826/unknown.png)
![Screenshot](https://cdn.discordapp.com/attachments/825106108926263349/825118802361450526/unknown.png)
