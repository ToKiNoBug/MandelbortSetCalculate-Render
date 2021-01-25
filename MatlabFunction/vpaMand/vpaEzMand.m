function [Map,Pic] =vpaEzMand(Width,Height,Scale,Depth,Accu)
Map=vpaMandMap(Width,Height,Scale,Depth,Accu);
Pic=MandDistRender(Map);
imagesc(Pic);
return;
end

