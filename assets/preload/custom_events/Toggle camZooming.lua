function onEvent(n,v1,v2)
  if n == 'Toggle camZooming' then
    if v1 == 'false' then
      setProperty('camZooming', false)
    end
    if v1 == 'true' or v1 == '' then
      setProperty('camZooming', true)
    end
  end
end