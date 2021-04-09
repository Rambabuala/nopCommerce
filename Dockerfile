FROM mcr.microsoft.com/dotnet/aspnet:5.0
LABEL author="Rambabu Alaparthi"
LABEL organization="Quality Thought"
COPY nop /nop-bin
WORKDIR /nop-bin
EXPOSE 80
ENTRYPOINT [ "dotnet", "/nop-bin/Nop.Web.dll" ]