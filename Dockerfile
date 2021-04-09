FROM ubuntu:20.04 as builder
RUN apt-update && apt-install unzip -y
ADD https://github.com/nopSolutions/nopCommerce/releases/download/release-4.40.3/nopCommerce_4.40.3_NoSource_linux_x64.zip /nop/nopCommerce_4.40.3_NoSource_linux_x64.zip
RUN CD nop && unzip nopCommerce_4.40.3_NoSource_linux_x64.zip && rm nopCommerce_4.40.3_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/aspnet:5.0
LABEL author="Rambabu Alaparthi"
LABEL organization="Quality Thought"
COPY --from=builder /nop /nop-bin
WORKDIR /nop-bin
EXPOSE 80
ENTRYPOINT [ "dotnet", "/nop-bin/Nop.Web.dll" ]