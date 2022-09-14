// Autogenerated from Pigeon (v4.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package tech.bam.flutter_reach_five.android;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class ReachFiveApi {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class ReachFiveConfigInterface {
    private @NonNull String domain;
    public @NonNull String getDomain() { return domain; }
    public void setDomain(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"domain\" is null.");
      }
      this.domain = setterArg;
    }

    private @NonNull String clientId;
    public @NonNull String getClientId() { return clientId; }
    public void setClientId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"clientId\" is null.");
      }
      this.clientId = setterArg;
    }

    private @NonNull String scheme;
    public @NonNull String getScheme() { return scheme; }
    public void setScheme(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"scheme\" is null.");
      }
      this.scheme = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private ReachFiveConfigInterface() {}
    public static final class Builder {
      private @Nullable String domain;
      public @NonNull Builder setDomain(@NonNull String setterArg) {
        this.domain = setterArg;
        return this;
      }
      private @Nullable String clientId;
      public @NonNull Builder setClientId(@NonNull String setterArg) {
        this.clientId = setterArg;
        return this;
      }
      private @Nullable String scheme;
      public @NonNull Builder setScheme(@NonNull String setterArg) {
        this.scheme = setterArg;
        return this;
      }
      public @NonNull ReachFiveConfigInterface build() {
        ReachFiveConfigInterface pigeonReturn = new ReachFiveConfigInterface();
        pigeonReturn.setDomain(domain);
        pigeonReturn.setClientId(clientId);
        pigeonReturn.setScheme(scheme);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("domain", domain);
      toMapResult.put("clientId", clientId);
      toMapResult.put("scheme", scheme);
      return toMapResult;
    }
    static @NonNull ReachFiveConfigInterface fromMap(@NonNull Map<String, Object> map) {
      ReachFiveConfigInterface pigeonResult = new ReachFiveConfigInterface();
      Object domain = map.get("domain");
      pigeonResult.setDomain((String)domain);
      Object clientId = map.get("clientId");
      pigeonResult.setClientId((String)clientId);
      Object scheme = map.get("scheme");
      pigeonResult.setScheme((String)scheme);
      return pigeonResult;
    }
  }

  public interface Result<T> {
    void success(T result);
    void error(Throwable error);
  }
  private static class ReachFiveHostApiCodec extends StandardMessageCodec {
    public static final ReachFiveHostApiCodec INSTANCE = new ReachFiveHostApiCodec();
    private ReachFiveHostApiCodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return ReachFiveConfigInterface.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof ReachFiveConfigInterface) {
        stream.write(128);
        writeValue(stream, ((ReachFiveConfigInterface) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface ReachFiveHostApi {
    void initialize(@NonNull ReachFiveConfigInterface config, Result<ReachFiveConfigInterface> result);

    /** The codec used by ReachFiveHostApi. */
    static MessageCodec<Object> getCodec() {
      return ReachFiveHostApiCodec.INSTANCE;
    }

    /** Sets up an instance of `ReachFiveHostApi` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, ReachFiveHostApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.ReachFiveHostApi.initialize", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              ArrayList<Object> args = (ArrayList<Object>)message;
              ReachFiveConfigInterface configArg = (ReachFiveConfigInterface)args.get(0);
              if (configArg == null) {
                throw new NullPointerException("configArg unexpectedly null.");
              }
              Result<ReachFiveConfigInterface> resultCallback = new Result<ReachFiveConfigInterface>() {
                public void success(ReachFiveConfigInterface result) {
                  wrapped.put("result", result);
                  reply.reply(wrapped);
                }
                public void error(Throwable error) {
                  wrapped.put("error", wrapError(error));
                  reply.reply(wrapped);
                }
              };

              api.initialize(configArg, resultCallback);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
              reply.reply(wrapped);
            }
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}
