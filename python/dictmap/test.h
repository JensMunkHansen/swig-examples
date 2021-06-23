    #pragma once
    
    #include <iostream>
    #include <string>
    #include <unordered_map>
    
    void method(std::unordered_map<std::string, std::string>* inout) {
    
      for( const auto& n : (*inout) ) {
        std::cout << "Key:[" << n.first << "] Value:[" << n.second << "]\n";
      }
    
      (*inout)["BLACK"] = "#000000";
    };
